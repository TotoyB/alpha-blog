require 'test_helper'

class CreateCategories < ActionDispatch::IntegrationTest

  test "invalid category submission results in failure" do
    assert_template 'categories/new'

    assert_select 'h2.panel-title'

    assert_select 'div.panel-body'

  end
end