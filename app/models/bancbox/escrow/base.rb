module Bancbox::Escrow
  class Base < ActiveRecord::Base
    include Bancbox::Escrow::Data
    include Bancbox::Escrow::State
    include Network
    include Bancbox::Escrow::BancboxCalls
  end
end

