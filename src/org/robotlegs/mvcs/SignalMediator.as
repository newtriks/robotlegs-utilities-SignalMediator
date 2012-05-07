package org.robotlegs.mvcs {

import net.richardlord.signals.SignalBase;

import org.robotlegs.core.ISignalMap;

public class SignalMediator extends Mediator {

    protected var _signalMap:ISignalMap;

    public function SignalMediator() {
        super();
    }

    override public function preRemove():void {
        signalMap.removeAll();
        super.preRemove();
    }

    protected function get signalMap():ISignalMap {
        return _signalMap ||= new SignalMap();
    }

    protected function addToSignal(signal:SignalBase, handler:Function):void {
        signalMap.addToSignal(signal, handler);
    }

}

}