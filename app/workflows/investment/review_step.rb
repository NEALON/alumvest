class ReviewStep < NavigableStep

  def label
    'Review'
  end

  def checked?
    false
  end

  def enabled?
    false
  end

  def active?(active_view)
    active_view == 'review'
  end

  def link
    '#'
  end
end
