# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.setup' do
  include_context 'setup'

  subject { object.setup(settings) }

  let(:object) { described_class }

  it 'should return self' do
    expect(subject).to eql(object)
  end

  it 'should set root' do
    subject
    expect(object.root).to be(root)
  end
end
