require 'rails_helper'

RSpec.describe Recipe do
  describe 'it exists' do
    let(:data) do
      { recipe:
        {
          url: 'http://www.myrecipes.com/recipe/arriba-peru',
          label: 'Arriba Peru',
          image: 'https://edamam-product-images.s3.amazonaws.com/web-img/94a/94ae284ebf42c5c4d0806bc6b70964b6.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIDKMti0wMMx96lkcdH0grWLGICuct8QkaG53EF%2BqpBjJAiEAmevpNmDQfCuK5WK7DBdmgdizqg3phwfJEchCeE9fncAq1QQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDJ6b66GHvVzt%2BMUUrCqpBEiz2dgF7WwceDq0DmJX7FnKZlc7L%2FT8oGYWA9PneWZXOldwEyepqej1Akb4tPON8Sa2wMHFCT7bFzPwCUYeTgdZpV8PVDSaYdWLr%2FEtRFrzK6L8qj8rH%2BkilQsQJlbMX4cU8QZn9Orx3fGH8OqKx%2FoTOJCFJv%2FySfqJnioZsWDV0i1pgj5Gi36KCXcrySPMFDEKBsVZSLknkBFFIzXtN%2BFqJKGXQ8S0qWgqBI9uV55%2BxtPqIWq%2BNeInoAGkqfVxVjjik8Ci%2FDAj7xEd%2FsHsbtKLPM7pY1rUhjcMTW%2BCShcuAlJ2YW%2F%2BYg8BalOVA0O3Rc15ki7GYnqBKinmEJwy8GVNmFqihVADXiT7MYlpvF51gnaf5iiUzl8VWZBIRda5J3ED6%2B3hhIU%2BzK44eZkPN%2B1%2F8P6OXxTD9i9j1M6A%2BbRkyLR2PzIZ1NkdCWQ9il2IshebyNUFOzzGfiIUx94t8OMQgXGHo8JZj%2BsZFPbxM2VIqP4Q2HZ%2By3knvitRDwWgoST9ug2iremD8136D%2FJ1Qr3U5AcQQT%2Fms%2F%2F6rCGj9n%2FP5A1FvGtCG8oHB6bn9%2BFvXBGHtJILZwks%2FqKhm9mIi3qiZ%2FErC9vCaWmIUgA4TazqK%2FO5DQ%2B57yMnAzhxrOWegVOj9InDG8D87I4sKva7vDl1NDQtpwvE6DVSaNk1ChBpuLEkzAl4Br9Px7ttiFNNO3MkD8ErVC%2BANc8%2BXogo4lm8P95drv9gjY4wk%2BDFmwY6qQEE5ogk7f0BMUQ0ulSDEb1fbXEOCewqgGQAhqXoKhQlkigLQiagHx4px7hVr2aN7BWb48VSxObQRYCUbxixH5k0VY7JvyuhDq9Z%2FXw%2FEeAiHshuUoaSOmlsn%2FQK%2FPwzpehxqJBC%2FnLBr%2FiakNpS3cv%2BgxazPfj17YmE1ffMIGQjOJ467RpjL4UDQteogqv6jWkqyrIfd9p4g2euRqfb5f%2FzfhEWSCrSVnbs&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221113T235213Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIMGKMDGI%2F20221113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ec3a59afb20ac030b11fe64e0002e677f9a28110003ea3d71d5dd77c35ae2f10'
        } }
    end

    it 'has attributes' do
      country = 'peru'
      recipe = Recipe.new(data, country)
      
      expect(recipe).to be_instance_of(Recipe)
      expect(recipe.country).to eq('peru')
      expect(recipe.url).to eq('http://www.myrecipes.com/recipe/arriba-peru')
      expect(recipe.title).to eq('Arriba Peru')
      expect(recipe.image).to eq('https://edamam-product-images.s3.amazonaws.com/web-img/94a/94ae284ebf42c5c4d0806bc6b70964b6.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEM%2F%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIDKMti0wMMx96lkcdH0grWLGICuct8QkaG53EF%2BqpBjJAiEAmevpNmDQfCuK5WK7DBdmgdizqg3phwfJEchCeE9fncAq1QQIyP%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDJ6b66GHvVzt%2BMUUrCqpBEiz2dgF7WwceDq0DmJX7FnKZlc7L%2FT8oGYWA9PneWZXOldwEyepqej1Akb4tPON8Sa2wMHFCT7bFzPwCUYeTgdZpV8PVDSaYdWLr%2FEtRFrzK6L8qj8rH%2BkilQsQJlbMX4cU8QZn9Orx3fGH8OqKx%2FoTOJCFJv%2FySfqJnioZsWDV0i1pgj5Gi36KCXcrySPMFDEKBsVZSLknkBFFIzXtN%2BFqJKGXQ8S0qWgqBI9uV55%2BxtPqIWq%2BNeInoAGkqfVxVjjik8Ci%2FDAj7xEd%2FsHsbtKLPM7pY1rUhjcMTW%2BCShcuAlJ2YW%2F%2BYg8BalOVA0O3Rc15ki7GYnqBKinmEJwy8GVNmFqihVADXiT7MYlpvF51gnaf5iiUzl8VWZBIRda5J3ED6%2B3hhIU%2BzK44eZkPN%2B1%2F8P6OXxTD9i9j1M6A%2BbRkyLR2PzIZ1NkdCWQ9il2IshebyNUFOzzGfiIUx94t8OMQgXGHo8JZj%2BsZFPbxM2VIqP4Q2HZ%2By3knvitRDwWgoST9ug2iremD8136D%2FJ1Qr3U5AcQQT%2Fms%2F%2F6rCGj9n%2FP5A1FvGtCG8oHB6bn9%2BFvXBGHtJILZwks%2FqKhm9mIi3qiZ%2FErC9vCaWmIUgA4TazqK%2FO5DQ%2B57yMnAzhxrOWegVOj9InDG8D87I4sKva7vDl1NDQtpwvE6DVSaNk1ChBpuLEkzAl4Br9Px7ttiFNNO3MkD8ErVC%2BANc8%2BXogo4lm8P95drv9gjY4wk%2BDFmwY6qQEE5ogk7f0BMUQ0ulSDEb1fbXEOCewqgGQAhqXoKhQlkigLQiagHx4px7hVr2aN7BWb48VSxObQRYCUbxixH5k0VY7JvyuhDq9Z%2FXw%2FEeAiHshuUoaSOmlsn%2FQK%2FPwzpehxqJBC%2FnLBr%2FiakNpS3cv%2BgxazPfj17YmE1ffMIGQjOJ467RpjL4UDQteogqv6jWkqyrIfd9p4g2euRqfb5f%2FzfhEWSCrSVnbs&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221113T235213Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFIMGKMDGI%2F20221113%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=ec3a59afb20ac030b11fe64e0002e677f9a28110003ea3d71d5dd77c35ae2f10')
    end
  end
end
