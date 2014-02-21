class SigningStep < NavableStep

  def label
    'Document Signings'
  end

  def checked?
    false
  end

  def enabled?
    false
  end

  def active?(active_view)
    active_view == 'investment_documents'
  end

  def link
    '#'
  end
end
