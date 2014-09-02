require 'spec_helper'

describe 'ejabberd' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "ejabberd class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('ejabberd') }
        it { should contain_class('ejabberd::params') }
        it { should contain_class('ejabberd::install').that_comes_before('ejabberd::config') }
        it { should contain_class('ejabberd::config') }
        it { should contain_class('ejabberd::service').that_subscribes_to('ejabberd::config') }

        it { should contain_service('ejabberd') }
        it { should contain_package('ejabberd').with_ensure('present') }

        it { should contain_file('/etc/ejabberd/ejabberd.cfg') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'ejabberd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
        :osfamily        => 'Redhat',
      }}

      it { expect { should contain_package('ejabberd') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
