# frozen_string_literal: true

require 'spec_helper'

describe Devise::JWT::Railtie do
  let(:rails) { Rails }
  let(:rails_config) { Rails.configuration }

  it 'adds JWTAuth middleware' do
    expect(rails_config.middleware).to include(Warden::JWTAuth::Middleware)
  end

  it 'configure mappings using defaults' do
    expect(Warden::JWTAuth.config.mappings).to eq(
      jwt_user: JwtUser
    )
  end

  it 'configures dispatch_requests using defaults' do
    expect(Warden::JWTAuth.config.dispatch_requests).to eq(
      [['POST', %r{^/jwt_users/sign_in$}]]
    )
  end

  it 'configures revocation_requests using defaults' do
    expect(Warden::JWTAuth.config.revocation_requests).to eq(
      [['DELETE', %r{^/jwt_users/sign_out$}]]
    )
  end
end