package org.robotlegs.core {
import net.richardlord.signals.SignalBase;

public interface ISignalMap {
    function addToSignal(signal:SignalBase, handler:Function):void;

    function removeFromSignal(signal:SignalBase, handler:Function):void;

    function removeAll():void;

}

}