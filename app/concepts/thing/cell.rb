class Thing::Cell < Cell::Concept
  include ::Cell::Slim
  include ActionView::Helpers::DateHelper

  property :name
  property :created_at

  def show
    render
  end

  private

  def classes
    classes = ['large-3', 'columns']
    classes << 'end' if options[:last] == model
    classes
  end

  def created_at
    time_ago_in_words(super)
  end

  def name_link
    link_to model.name, thing_path(model)
  end

  def from_created_at
    "Posted: #{created_at} ago"
  end
end
