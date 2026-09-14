class Project < ApplicationRecord
  has_many_attached :files

  validates :title, presence: true, length: { maximum: 80 }
  validates :description, presence: true, length: { maximum: 1_000 }
  validates :tech_stack, length: { maximum: 200 }
  validate :validate_files

  private

  def validate_files
    if files.length > 5
      errors.add(:files, "은 한 프로젝트당 최대 5개까지 업로드할 수 있습니다.")
    end

    files.each do |file|
      if file.blob.byte_size > 20.megabytes
        errors.add(:files, "은 파일당 20MB 이하만 업로드할 수 있습니다.")
      end
    end
  end
end
