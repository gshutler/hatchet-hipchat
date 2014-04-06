require_relative 'spec_helper'

describe HipChatEmoticonFormatter do
  let(:formatter) { HipChatEmoticonFormatter.new }
  let(:context)   { 'Context' }
  let(:message)   { Hatchet::Message.new(ndc: [:one, :two], message: 'Hello, World') }

  it 'maps debug to (content)' do
    assert '(content) - Context one two - Hello, World' == formatter.format(:debug, context, message)
  end

  it 'maps info to (wat)' do
    assert '(wat) - Context one two - Hello, World' == formatter.format(:info, context, message)
  end

  it 'maps warn to (ohcrap)' do
    assert '(ohcrap) - Context one two - Hello, World' == formatter.format(:warn, context, message)
  end

  it 'maps error to (omg)' do
    assert '(omg) - Context one two - Hello, World' == formatter.format(:error, context, message)
  end

  it 'maps fatal to (boom)' do
    assert '(boom) - Context one two - Hello, World' == formatter.format(:fatal, context, message)
  end

  describe 'backtrace limiting' do
    let(:error) { OpenStruct.new(message: 'Boom!', backtrace: (1..10).map { |i| "foo.rb:#{i}:a" }) }
    let(:message) { Message.new(ndc: [], message: '  Hello, World  ', error: error) }

    it "includes #{HipChatEmoticonFormatter::DEFAULT_BACKTRACE_LIMIT} lines of backtrace" do
      assert (1 + HipChatEmoticonFormatter::DEFAULT_BACKTRACE_LIMIT) == formatter.format(:error, context, message).lines.count
    end
  end
end
