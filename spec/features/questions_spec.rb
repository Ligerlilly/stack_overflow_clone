describe 'questions' do
  before do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it 'questions can be created' do
    visit '/'
    click_link 'New Question'
    fill_in 'Title', with: 'hi'
    fill_in 'Content', with: 'there'
    click_button 'Create Question'
    expect(page).to have_content 'hi'
  end

  it 'questions can be edited' do
    visit '/'
    click_link 'New Question'
    fill_in 'Title', with: 'hi'
    fill_in 'Content', with: 'there'
    click_button 'Create Question'
    click_link 'hi'
    click_link 'Edit'
    fill_in 'Title', with: 'hello'
    click_button 'Update Question'
    expect(page).to have_content 'hello'
  end

  it 'questions can be edited' do
    visit '/'
    click_link 'New Question'
    fill_in 'Title', with: 'hi'
    fill_in 'Content', with: 'there'
    click_button 'Create Question'
    click_link 'hi'
    click_link 'Delete'
    expect(page).to_not have_content 'hi'
  end

end
