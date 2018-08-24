RSpec.describe ApplicationHelper, type: :helper do
  describe 'active_for' do
    it 'returns empty strign' do
      expect(active_for(:controller)).to eq('')
    end

    it 'returns active for active for matching controller' do
      params[:controller] = 'proper_controller'
      expect(active_for(:proper_controller)).to eq('active')
    end
  end
end
