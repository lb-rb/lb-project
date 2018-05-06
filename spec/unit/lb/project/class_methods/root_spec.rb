# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.root' do
  subject { object.root }

  let(:object) { described_class }

  context 'without setup' do
    it 'should return nil' do
      expect(subject).to be_nil
    end
  end

  context 'without setup' do
    let(:root) { double(:root) }

    before(:each) do
      object.setup(root)
    end

    after(:each) do
      object.remove_instance_variable(:@root)
    end

    it 'should return nil' do
      expect(subject).to be(root)
    end
  end
end
