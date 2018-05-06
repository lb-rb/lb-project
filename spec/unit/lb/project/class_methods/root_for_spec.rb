# frozen_string_literal: true

require 'spec_helper'

describe LB::Project, '.root_for' do
  subject { object.root_for(*args) }

  let(:args)   { [file] }
  let(:object) { described_class }
  let(:file)   { __FILE__ }

  let(:expected) { File.dirname(File.dirname(File.expand_path(file))) }

  it 'should equal the absolute parent path (two directory levels up)' do
    expect(subject).to eql(expected)
  end

  context 'with depth of 3' do
    let(:args) { [file, 3] }
    let(:expected) do
      File.dirname(File.dirname(File.dirname(File.expand_path(file))))
    end

    it 'should equal the absolute parent path (two directory levels up)' do
      expect(subject).to eql(expected)
    end
  end
end
