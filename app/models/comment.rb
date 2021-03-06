class Comment < ActiveRecord::Base
  validates :content, :submitter_id, :post_id, presence: true

  belongs_to :submitter, class_name: "User", foreign_key: :submitter_id, primary_key: :id

  belongs_to :post


  belongs_to :parent_comment, class_name: "Comment", foreign_key: :parent_comment_id, primary_key: :id
  has_many :child_comments, class_name: "Comment", foreign_key: :parent_comment_id, primary_key: :id

  has_many :votes, as: :votable

  def sum_votes
    self.votes.sum(:value)
  end
end
