class MedicationsController < ApplicationController
  def index
    @medications = current_user.medications
  end

  def new
    @medication = current_user.medications.build
  end

  def create
    @medication = current_user.medications.build(medication_params)
    if @medication.save
      redirect_to medications_path, notice: "薬を登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @medication = current_user.medications.find(params[:id])
  end

  def update
    @medication = current_user.medications.find(params[:id])
    if @medication.update(medication_params)
      redirect_to medications_path, notice: "薬を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @medication = current_user.medications.find(params[:id])
    @medication.destroy
    redirect_to medications_path, notice: "薬を削除しました"
  end

  private

  def medication_params
    params.require(:medication).permit(:name, :use, :start_date, :end_date, dosage_ids: [])
  end
end
