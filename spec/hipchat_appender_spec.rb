require_relative 'spec_helper'

describe HipChatAppender do
  before do
    # Replace the client class.
    HipChatAppender.send :remove_const, :CLIENT
    HipChatAppender::CLIENT = FakeClient
  end

  describe 'default formatter' do
    let(:subject) { HipChatAppender.new }

    it 'uses the SimpleFormatter by default' do
      assert_instance_of(SimpleFormatter, subject.formatter)
    end
  end

  describe 'sending messages' do
    let(:subject) do
      HipChatAppender.new do |appender|
        appender.level :warn
        appender.api_token = 'MY_TOKEN'
        appender.room_id   = 'ROOM_ID'
      end
    end

    before do
      subject.add :warn, 'Custom::Context', Message.new('Hello, World')
    end

    let(:message) { subject.client.messages.last }

    it 'configures the client with the API token' do
      assert 'MY_TOKEN' == subject.client.api_token
    end

    it 'sends a formatted message to the configured room' do
      assert 'ROOM_ID' == message.room_id
      formatted_message = subject.formatter.format(:warn, 'Custom::Context', Message.new('Hello, World'))
      assert 'Hatchet' == message.from
      assert formatted_message == message.message
      assert 0 == message.notify
      assert 'text' == message.format
    end

    describe 'setting name' do
      before do
        subject.name = 'CustomName'
      end

      before do
        subject.add :warn, 'Custom::Context', Message.new('Hello, World')
      end

      it 'sends a message with the configured name' do
        assert 'CustomName' == message.from
      end
    end

    describe 'message colors' do
      it 'sends a debug message with a gray background' do
        subject.add :debug, 'Custom::Context', Message.new('Hello, World')
        assert 'gray' == message.color
      end

      it 'sends an info message with a gray background' do
        subject.add :info, 'Custom::Context', Message.new('Hello, World')
        assert 'gray' == message.color
      end

      it 'sends a warn message with a yellow background' do
        subject.add :warn, 'Custom::Context', Message.new('Hello, World')
        assert 'yellow' == message.color
      end

      it 'sends an error message with a red background' do
        subject.add :error, 'Custom::Context', Message.new('Hello, World')
        assert 'red' == message.color
      end

      it 'sends a fatal message with a red background' do
        subject.add :fatal, 'Custom::Context', Message.new('Hello, World')
        assert 'red' == message.color
      end
    end
  end
end

