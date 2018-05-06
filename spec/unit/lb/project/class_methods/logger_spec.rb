# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.logger' do
  subject { object.logger }

  let(:object) { described_class }

  let(:expected_level) { Logger::INFO }

  let(:expected_type) { Logger }

  after(:each) do
    object.remove_instance_variable(:@logger)
  end

  it 'should return logger of type Logger' do
    expect(subject.class).to be(expected_type)
  end

  it 'should set log level to info' do
    expect(subject.level).to be(expected_level)
  end
end
