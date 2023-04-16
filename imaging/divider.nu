def divider [] {
    let a = "\e]1337;File=inline=1;width=100%%;height=1;preserveAspectRatio=0"
    let b =  ":"
    # this is just a 1x1 white png image
    let c = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABAQMAAAAl21bKAAABb2lDQ1BpY2MAACiRdZE7SwNBFIW/RIOikRRaiFgsEkVEISiIpcbCJkiICkZtknWTCNl12U0QsRVsLAQL0cZX4T/QVrBVEARFELHyB/hqJKx3jJAgySyz9+PMnMvMGfDH8rrpNkbAtApOYiqqzScXtKZXAoQIMkBPSnftiXg8Rt3xdY9P1bsh1av+vpqjddlwdfA1C4/qtlMQHheOrRVsxdvCHXoutSx8JDzoyAGFr5WeLvOL4myZPxQ7s4lJ8KueWraK01Ws5xxTuF84bOaL+t951E2ChjU3I7VLZjcuCaaIopGmyAp5CgxJtSSz2r7Ir2+aVfHo8rdZxxFHlpx4B0UtSldDakZ0Q7486yr3/3m6mZHhcvdgFALPnvfeC027UNrxvO9jzyudQMMTXFoV/6rkNPYp+k5FCx9CaBPOrypaeg8utqDz0U45qV+pQaY/k4G3M2hLQvsttCyWs/pb5/QBZjfkiW5g/wD6ZH9o6Qf3IWgGVlxmOAAAAANQTFRF////p8QbyAAAAAlwSFlzAAAPYQAAD2EBqD+naQAAAApJREFUCFtjYAAAAAIAAWJAT2gAAAAASUVORK5CYII='
    let d = "\a"
    [ $a $b $c $d ] | str join
}