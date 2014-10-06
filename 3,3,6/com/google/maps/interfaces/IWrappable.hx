package com.google.maps.interfaces;

interface IWrappable
{
	function wrapper():Dynamic;

	function setWrapper(arg1:Dynamic):Void;

	function interfaceChain():Array<Dynamic>;
}