require 'test_helper'

module Vedeu
  EntityNotFound = Class.new(StandardError)

  class RepositoryTestClass
    include Repository

    def initialize(storage = {})
      @storage = storage
    end

    def add(entity)
      if storage.is_a?(Hash)
        @storage = in_memory.merge!(entity)

      else
        @storage << entity

      end
    end

    attr_accessor :storage
    alias_method :in_memory, :storage

    def not_found(name)
      fail EntityNotFound
    end
  end # RepositoryTestClass

  describe Repository do

    describe '#all' do
      it 'returns a Hash' do
        RepositoryTestClass.new.all.must_be_instance_of(Hash)
      end

      it 'returns the whole repository' do
        RepositoryTestClass.new.all.must_equal({})
      end
    end

    describe '#find' do
      it 'raises an exception when the entity cannot be found' do
        proc {
          RepositoryTestClass.new.find('terbium')
        }.must_raise(EntityNotFound)
      end

      context 'when the entity is found' do
        it 'returns the stored entity' do
          entity = { key: :value }
          repo   = RepositoryTestClass.new
          repo.add({ 'terbium' => entity })

          repo.find('terbium').must_equal(entity)
        end
      end
    end

    describe '#find_or_create' do
      context 'when the entity is found by name' do
        it 'returns the storage entity' do
          skip
        end
      end

      context 'when the entity is not found by name' do
        it 'stores the newly created entity' do
          skip
        end

        it 'returns the newly created entity' do
          skip
        end
      end
    end

    describe '#registered' do
      it 'returns an Array' do
        RepositoryTestClass.new.registered.must_be_instance_of(Array)
      end

      context 'when the storage is a Hash' do
        it 'returns a collection of the names of all the registered entities' do
          repo = RepositoryTestClass.new
          repo.add({ 'rutherfordium' => { name: 'rutherfordium' } })

          repo.registered.must_equal(['rutherfordium'])
        end
      end

      context 'when the storage is an Array' do
        it 'returns the registered entities' do
          repo = RepositoryTestClass.new([])
          repo.add('rutherfordium')

          repo.registered.must_equal(['rutherfordium'])
        end
      end

      context 'when the storage is a Set' do
        it 'returns the registered entities' do
          repo = RepositoryTestClass.new(Set.new)
          repo.add('rutherfordium')

          repo.registered.must_equal(['rutherfordium'])
        end
      end

      it 'returns an empty collection when the storage is empty' do
        RepositoryTestClass.new.registered.must_equal([])
      end
    end

    describe '#registered?' do
      it 'returns false when the storage is empty' do
        RepositoryTestClass.new.registered?('terbium').must_equal(false)
      end

      it 'returns false when the entity is not registered' do
        repo = RepositoryTestClass.new
        repo.add({ name: 'samarium' })

        repo.registered?('terbium').must_equal(false)
      end

      it 'returns true when the entity is registered' do
        skip

        repo = RepositoryTestClass.new
        repo.add({ name: 'samarium' })

        repo.registered?('samarium').must_equal(true)
      end
    end

    describe '#remove' do
      context 'when the storage is empty' do
        it 'returns false' do
          test_repo = RepositoryTestClass.new
          test_repo.remove('francium').must_equal(false)
        end
      end

      context 'when the entity is not registered' do
        it 'returns false' do
          test_repo = RepositoryTestClass.new
          test_repo.add({
            'gadolinium' => 'rare-earth metal',
            'samarium'   => 'a hard silvery metal'
          })
          test_repo.remove('francium').must_equal(false)
        end
      end

      context 'when the entity is registered' do
        it 'returns the storage with the entity removed' do
          test_repo = RepositoryTestClass.new
          test_repo.add({
            'gadolinium' => 'rare-earth metal',
            'samarium'   => 'a hard silvery metal'
          })
          test_repo.remove('samarium').must_equal({
            'gadolinium' => 'rare-earth metal',
          })
        end
      end

      context 'alias method: #destroy' do
        it 'returns the storage with the entity removed' do
          test_repo = RepositoryTestClass.new
          test_repo.add({
            'gadolinium' => 'rare-earth metal',
            'samarium'   => 'a hard silvery metal'
          })
          test_repo.destroy('samarium').must_equal({
            'gadolinium' => 'rare-earth metal',
          })
        end
      end

      context 'alias method; #delete' do
        it 'returns the storage with the entity removed' do
          test_repo = RepositoryTestClass.new
          test_repo.add({
            'gadolinium' => 'rare-earth metal',
            'samarium'   => 'a hard silvery metal'
          })
          test_repo.delete('samarium').must_equal({
            'gadolinium' => 'rare-earth metal',
          })
        end
      end
    end

    describe '#reset' do
      it 'returns a Hash' do
        RepositoryTestClass.new.reset.must_be_instance_of(Hash)
      end

      it 'resets the repository' do
        RepositoryTestClass.new.reset.must_equal({})
      end
    end

  end # Repository

end # Vedeu
