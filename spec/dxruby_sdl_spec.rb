# -*- coding: utf-8 -*-
require 'spec_helper'

describe DXRubySDL do
  describe '::VERSION' do
    subject { described_class::VERSION }

    it { should be_instance_of(String) }
    it { should match(/\A[0-9]\.[0-9]+\.[0-9]+\z/) }
  end

  describe 'require \'dxruby\'' do
    before do
      require 'dxruby'
    end

    %w[
      Window
      Image
      Font
    ].each do |klass_name|
      it "トップレベルに#{klass_name}が定義されている" do
        expect {
          # rubocop:disable Eval
          eval("::#{klass_name}")
          # rubocop:enable Eval
        }.not_to raise_error
      end
    end
  end
end
