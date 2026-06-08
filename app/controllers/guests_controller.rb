class GuestsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    user = User.create!(
      email: "guest_#{SecureRandom.uuid}@example.com",
      password: SecureRandom.hex(16),
      username: "ゲスト"
    )

    # サンプルの薬を登録
    dosages = Dosage.all
    medication = user.medications.create!(
      name: "クラリスロマイシン",
      use: "抗生剤",
      start_date: Date.current
    )
    medication.dosages << dosages.find_by(name: "朝食後")
    medication.dosages << dosages.find_by(name: "昼食後")
    medication.dosages << dosages.find_by(name: "夕食後")

    # サンプルの薬を登録
    dosages = Dosage.all
    medication = user.medications.create!(
      name: "カロナール",
      use: "解熱",
      start_date: Date.current
    )
    medication.dosages << dosages.find_by(name: "朝食後")
    medication.dosages << dosages.find_by(name: "夕食後")

    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
end
