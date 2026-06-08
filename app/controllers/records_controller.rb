class RecordsController < ApplicationController
  def index
    @user = current_user
    @today_record = current_user.records.find_or_initialize_by(date: Date.current)

    @medications = current_user.medications.where(
      "start_date <= ? AND (end_date IS NULL OR end_date >= ?)",
      Date.current,
      Date.current
    )

    @dosages = Dosage.all
  end

  def new
    @record = Record.new
  end

  def create
    date = record_params[:date].presence || Date.current

    @today_record = current_user.records.find_or_initialize_by(date: date)
    @today_record.memo = record_params[:memo]

    if @today_record.save
      @today_record.medication_records.destroy_all
      params[:medication_records]&.each do |value|medication_id, dosage_id = value.split("-")
        @today_record.medication_records.create!(
          medication_id: medication_id,
          dosage_id: dosage_id,
          taken: true
        )
      end
      redirect_to record_by_date_path(date: Date.current), notice: "記録を保存しました"
    else
      @medications = Medication.where(
        "state_date <= ? AND (end_date IS NULL OR end_date >= ?)",
        Date.current, Date.current
      )
      @dosages = Dosage.all
      render :index, status: :unprocessable_entity
    end

    # デバッグ
    Rails.logger.debug "params =  #{params.inspect}"
    Rails.logger.debug params.inspect
    Rails.logger.debug @today_record.inspect
  end

  def show
    date = (params[:date] || Date.current).to_date

    @record = current_user.records.find_by(date: date)
    @selected_date = date
    @start_date = date.beginning_of_month
    @end_date = date.end_of_month
    @records = current_user.records.where(date: @start_date..@end_date).index_by { |r| r.date.to_date }
    @calendar_days = (@start_date..@end_date).to_a
    @medications = current_user.medications.where(
      "start_date <= ? AND (end_date IS NULL OR end_date >= ?)",
      date, date
)
  end

  private
  def record_params
    params.require(:record).permit(:date, :memo, medication_records: [])
  end
end
