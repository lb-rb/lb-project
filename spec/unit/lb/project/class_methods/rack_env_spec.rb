# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.rack_env' do
  subject { object.rack_env }

  let(:object) { described_class }

  let(:default) { 'development' }

  let(:env) { 'RACK_ENV' }

  after(:each) do
    object.remove_instance_variable(:@rack_env)
  end

  context 'without RACK_ENV' do
    it 'should return default RACK_ENV' do
      expect(subject).to eql(default)
    end
  end

  context 'with RACK_ENV=production' do
    let(:rack_env) { 'production' }

    before(:each) do
      ENV[env] = rack_env
    end

    after(:each) do
      ENV.delete(env)
    end

    it 'should return production' do
      expect(subject).to eql(rack_env)
    end
  end
end
