require 'spec_helper'

describe 'skyline' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "skyline class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should include_class('skyline::params') }

        it { should contain_class('skyline::install') }
        it { should contain_class('skyline::config') }
        it { should contain_class('skyline::service') }
      end
    end
  end

  context 'unsupported operating system redhat' do
    describe 'skyline class without any parameters on RedHat' do
      let(:facts) {{
        :osfamily        => 'RedHat',
        :operatingsystem => 'Foo',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Foo not supported/) }
    end
  end

  context 'unsupported operating system' do
    describe 'skyline class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
