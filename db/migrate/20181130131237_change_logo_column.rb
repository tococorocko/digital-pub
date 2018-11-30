class ChangeLogoColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :teams, :logo, :type, :default => "https://www.shareicon.net/data/2015/12/22/691473_security_512x512.png"
  end
end
