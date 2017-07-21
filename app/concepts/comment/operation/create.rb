class Comment::Create < Trailblazer::Operation
  step Model(Comment, :create)
  step :assign_thing!
  step :assign_current_user!
  step Contract::Build( constant: Comment::Contract::Create )
  step Contract::Validate( key: :comment )
  step Contract::Persist()

  private

  def assign_thing!(options)
    options['model'].thing = Thing.find_by_id(options[:thing_id])
  end

  def assign_current_user!(options)
    options['model'].user = User.find_by_id(options[:user_id])
  end
end
