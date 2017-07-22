class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :create)
    step :assign_thing!
    step Contract::Build( constant: Comment::Contract::Create )

    private

    def assign_thing!(options, params:, **)
      options['model'].thing = Thing.find_by_id(params[:thing_id])
      options['model'].build_user
    end
  end

  step Nested(Present)
  step Contract::Validate( key: :comment )
  step Contract::Persist()
end
