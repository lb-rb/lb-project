# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.config' do
  subject { object.config }

  let(:object) { described_class }

  let(:default_hash) do
    {
      base_path: '',
      image_base_path: 'assets/images',
      public_path: 'docs',
      template_path: 'templates'
    }
  end

  let(:default) { LB::Project::Config.new(default_hash) }

  let(:env) { 'RACK_ENV' }

  before(:each) do
    root = LB::Project.root_for(__FILE__, 6)
    LB::Project.setup(File.join(root, 'spec/fixtures'))
  end

  after(:each) do
    object.remove_instance_variable(:@rack_env)
    object.remove_instance_variable(:@config)
    object.remove_instance_variable(:@root)
  end

  context 'without RACK_ENV' do
    it 'should return default config' do
      expect(subject).to eql(default)
    end
  end

  context 'with RACK_ENV=production' do
    let(:production_hash) { default_hash.merge(public_path: 'htdocs') }
    let(:production) { LB::Project::Config.new(production_hash) }
    let(:rack_env) { 'production' }

    before(:each) do
      ENV[env] = rack_env
    end

    after(:each) do
      ENV.delete(env)
    end

    it 'should return production config' do
      expect(subject).to eql(production)
    end
  end
end
