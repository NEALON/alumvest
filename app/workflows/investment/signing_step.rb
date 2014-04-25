class SigningStep < NavigableStep

  def label
    'Contracts'
  end

  def checked?
    false
  end

  def enabled?
    @investment.persisted?
  end

  def active?(active_view)
    active_view == 'investment_documents'
  end

  def link
    if @investment.new_record?
      '#'
    else
      campaign_investment_contract_doc_group_path(@investment.campaign, @investment)
    end
  end
end
