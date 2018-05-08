# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.config' do
  subject { object.config }

  let(:object) { described_class }

  context 'without setup' do
    it 'should raise argument error' do
      expect { subject }.to raise_error ArgumentError,
                                        'Call LB::Project.setup(...) first!'
    end
  end

  context 'without setup' do
    include_context 'setup'

    it 'should return config' do
      expect(subject).to be config
    end
  end
end
