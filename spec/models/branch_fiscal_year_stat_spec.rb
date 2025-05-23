require 'rails_helper'

RSpec.describe BranchFiscalYearStat, type: :model do
  describe 'バリデーションのテスト' do
    context '支店実績の年度が空文字の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, fiscal_year: "")
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の年度が3桁の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, fiscal_year: "202")
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の年間勤務日数が空文字の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, annual_working_days: "")
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の年間勤務日数が負の値の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, annual_working_days: -200)
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の年間勤務日数が400日の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, annual_working_days: 400)
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の従業員数が空文字の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, annual_employee_count: "")
        expect(stat).not_to be_valid
      end
    end

    context '支店実績の従業員数が負の値の場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.build(:branch_fiscal_year_stat, annual_employee_count: -10)
        expect(stat).not_to be_valid
      end
    end

    context '年度と支店idの両方について、同じ値がすでに登録されている場合' do
      it 'バリデーションに失敗する' do
        stat = FactoryBot.create(:branch_fiscal_year_stat)

        stat_new = FactoryBot.build(:branch_fiscal_year_stat, branch: stat.branch, updater: stat.updater)
        expect(stat_new).not_to be_valid
      end
    end

    context '年度と支店idのいずれかについて同じ値が登録されておらず、年間勤務日数、従業員数が正の値である場合' do
      it 'バリデーションに成功する' do
        stat = FactoryBot.create(:branch_fiscal_year_stat)

        stat_new = FactoryBot.build(:branch_fiscal_year_stat, fiscal_year: "2021", branch: stat.branch, updater: stat.updater)
        expect(stat_new).to be_valid
      end
    end
  end
end
