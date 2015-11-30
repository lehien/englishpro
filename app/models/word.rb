class Word < ActiveRecord::Base
  belongs_to :lesson
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|a| a[:content].blank?}
  validates :content, presence: true, uniqueness: true
  validate :check_correct_answer
  
  scope :search, ->search{where "content LIKE ?", "%#{search}%"}
  scope :alphabet, ->{order "content ASC"}
  scope :filter_lesson, ->lesson{where lesson_id: lesson if lesson.present?}
  scope :learned, ->user{where "id IN (SELECT word_id FROM results WHERE test_id IN 
    (SELECT id FROM tests WHERE user_id = ?) AND answer_id IN 
    (SELECT id FROM answers WHERE correct = 't'))", user.id}
  scope :not_learned, ->user{where "id NOT IN (SELECT word_id FROM results WHERE test_id IN 
    (SELECT id FROM tests WHERE user_id = ?) AND answer_id IN 
    (SELECT id FROM answers WHERE correct = 't'))", user.id}
  scope :get_all, ->user{}
  scope :random_words, ->{order "RANDOM() LIMIT #{Settings.max_word_per_lesson}"}
  
#  private
#  def check_correct_answer
#    errors.add :base, "not choice correct answers" if answers.select{|opt| opt.correct}.blank?
#  end

end
