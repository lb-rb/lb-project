# frozen_string_literal: true

shared_context 'setup' do
  let(:lb_root) { object.root_for(__FILE__, 3) }

  let(:root) { File.join(lb_root, 'spec/fixtures') }

  let(:config_file) { File.join(root, 'config/application.yml') }

  let(:config) { LB::Project::Config.load(config_file) }

  let(:settings) do
    LB::Project::Settings.new(
      root: root,
      config: config
    )
  end

  before(:each) do
    object.setup(settings)
  end

  after(:each) do
    if object.instance_variable_defined?(:@settings)
      object.remove_instance_variable(:@settings)
    end
  end
end
