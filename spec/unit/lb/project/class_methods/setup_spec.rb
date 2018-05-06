# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.setup' do
  subject { object.setup(root) }

  let(:root)   { double(:root) }
  let(:object) { described_class }

  after(:each) do
    object.remove_instance_variable(:@root)
  end

  it 'should return self' do
    expect(subject).to eql(object)
  end

  it 'should set root' do
    subject
    expect(object.root).to be(root)
  end
end
