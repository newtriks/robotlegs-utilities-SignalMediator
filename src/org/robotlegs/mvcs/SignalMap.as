package org.robotlegs.mvcs {
import flash.utils.Dictionary;

import net.richardlord.signals.SignalBase;

import org.robotlegs.core.ISignalMap;

public class SignalMap implements ISignalMap {
    protected var _handlersBySignal:Dictionary;

    public function SignalMap() {
        _handlersBySignal = new Dictionary();
    }

    public function addToSignal(signal:SignalBase, handler:Function):void {
        signal.add(handler);
        storeSignalHandler(signal, handler);
    }

    protected function storeSignalHandler(signal:SignalBase, handler:Function):void {
        if (_handlersBySignal[signal] == null) {
            _handlersBySignal[signal] = new <Function>[handler];
        }
        else {
            _handlersBySignal[signal].push(handler);
        }
    }

    public function removeFromSignal(signal:SignalBase, handler:Function):void {
        signal.remove(handler);

        if ((_handlersBySignal[signal] == null) || (_handlersBySignal[signal].length == 0)) {
            return;
        }

        var handlerIndex:int = _handlersBySignal[signal].indexOf(handler);

        if (handlerIndex > -1) {
            _handlersBySignal[signal].splice(handlerIndex, 1);
        }
    }

    public function removeAll():void {
        for (var signal:Object in _handlersBySignal) {
            var knownSignal:SignalBase = signal as SignalBase;

            var handlers:Vector.<Function> = _handlersBySignal[signal];
            for each(var handler:Function in handlers) {
                knownSignal.remove(handler);
            }
        }

        _handlersBySignal = new Dictionary();
    }

}
}