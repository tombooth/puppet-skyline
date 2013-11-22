require 'spec_helper'

describe 'skyline::service' do
  describe 'skyline::service class on Debian' do
    let(:facts) {{
      :osfamily => 'Debian',
    }}

    it {
      should contain_service('skyline-horizon')
      should contain_service('skyline-analyzer')
      should contain_service('skyline-webapp')
    }
  end
end

