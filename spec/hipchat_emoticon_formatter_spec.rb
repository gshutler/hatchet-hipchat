require_relative 'spec_helper'

describe HipChatEmoticonFormatter do
  let(:formatter) { HipChatEmoticonFormatter.new }
  let(:context)   { 'Context' }
  let(:message)   { 'Hello, World' }

  it 'maps debug to (content)' do
    assert '(content) - Context - Hello, World' == formatter.format(:debug, context, message)
  end

  it 'maps info to (wat)' do
    assert '(wat) - Context - Hello, World' == formatter.format(:info, context, message)
  end

  it 'maps warn to (ohcrap)' do
    assert '(ohcrap) - Context - Hello, World' == formatter.format(:warn, context, message)
  end

  it 'maps debug to (omg)' do
    assert '(omg) - Context - Hello, World' == formatter.format(:error, context, message)
  end

  it 'maps debug to (boom)' do
    assert '(boom) - Context - Hello, World' == formatter.format(:fatal, context, message)
  end
end
