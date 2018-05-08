# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.root' do
  subject { object.root }

  let(:object) { described_class }

  context 'without setup' do
    it 'should raise argument error' do
      expect { subject }.to raise_error ArgumentError,
                                        'Call LB::Project.setup(...) first!'
    end
  end

  context 'without setup' do
    include_context 'setup'

    it 'should return root' do
      expect(subject).to be(root)
    end
  end
end
