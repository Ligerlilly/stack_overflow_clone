describe 'Answers' do
  before do
    user = FactoryGirl.create(:user, id: 1)
    question = FactoryGirl.create(:question, title: "test?", content: "test", id: 3, user_id: 1)
    answer = FactoryGirl.create(:answer, user_id: 1, id: 3, question_id: 3)
    login_as(user, :scope => :user)
  end

  it 'can be created' do
    visit '/questions/3'
    fill_in "Response", with: "yes"
    click_button "Create Answer"
    expect(page).to have_content "yes"
  end

  it 'can be edited' do
    visit '/questions/3'
    within '.question-answers' do
      click_link 'Edit'
    end
    fill_in "Response", with: "no"
    click_button "Update Answer"
    expect(page).to have_content "no"
  end

  it 'can be deleted' do
    visit '/questions/3'
    within '.question-answers' do
      click_link 'Delete'
    end
    expect(page).to_not have_content "yolo"
  end
end
