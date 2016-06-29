Darkswarm.factory 'Dereferencer', ->
  new class Dereferencer
    dereference: (array, data) ->
      @dereference_from(array, array, data)

    dereference_from: (source, target, data) ->
      unreferenced = []
      if source && target
        for object, i in source
          key = if object then object.id else undefined
          if data.hasOwnProperty(key)
            target[i] = data[key]
          else
            delete target[i]
            unreferenced[i] = source[i]
      unreferenced
