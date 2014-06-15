class DisplaycurrencyInput < SimpleForm::Inputs::Base
  include ActionView::Helpers::NumberHelper
  
  def input(wrapper_options)
    template.content_tag(:div, object.send(attribute_name).blank? ? 'blank' : "#{number_to_currency(object.send(attribute_name))}", :class => object.send(attribute_name).blank? ? 'blank form-control-static' : 'form-control-static')
  end
  
  def additional_classes
    @additional_classes ||= [input_type].compact # original is `[input_type, required_class, readonly_class, disabled_class].compact`
  end
end