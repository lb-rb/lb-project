# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.development?' do
  subject { object.development? }

  let(:object) { described_class }

  let(:default) { 'development' }

  let(:env) { 'RACK_ENV' }

  after(:each) do
    object.remove_instance_variable(:@rack_env)
  end

  context 'without RACK_ENV' do
    it 'should return true' do
      expect(subject).to be true
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

    it 'should return false' do
      expect(subject).to be false
    end
  end
end
