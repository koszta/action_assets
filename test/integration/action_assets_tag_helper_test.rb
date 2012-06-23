require 'test_helper'

class ActionAssetsTagHelperTest < ActionDispatch::IntegrationTest
  
  test 'action assets tag attributes should contain the controller name' do
    get '/dummy/foo'
    assert_tag tag: 'html', attributes: {'data-controller' => 'dummy'}
  end
  
  test 'action assets tag attributes should contain the action name' do
    get '/dummy/foo'
    assert_tag tag: 'html', attributes: {'data-action' => 'foo'}
  end
  
  test 'action assets tag attributes should contain the layout virtual path' do
    get '/dummy/foo'
    assert_tag tag: 'html', attributes: {'data-layout' => 'layouts/application'}
  end
end
