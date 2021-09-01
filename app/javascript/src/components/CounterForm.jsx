import React, {useState} from 'react'
import MyButton from './UI/button/MyButton'


const CounterForm = ( {create} ) => {

      const [counter, setCounter] = useState( {title: "", value: 0} )


      const addNewCounter = (e) => {
        e.preventDefault()

        const newCounter = {
          ...counter,
          id: Date.now()
        }
        create(newCounter)
        setCounter({title: "", value: 0})
      }

  return (

    <form>
        <input
          onChange={ e => setCounter( {...counter, title:  e.target.value}    ) }
          value={counter.title}
          type="text"
          placeholder="Название"
        />
        <input
            onChange={ e => setCounter( {...counter, value:  e.target.value}    ) }
           value={counter.value}
            type="number"
            placeholder="Начальное значение"
          />
        <MyButton onClick={addNewCounter} >Cоздать пост</MyButton>
    </form>

  )


}

export default CounterForm
