/*
 * $Id$
 */

package com.modestmaps.geo;
 
import openfl.geom.Point;
import com.modestmaps.core.Coordinate;
import com.modestmaps.geo.Location;

interface IProjection
{
	/**
	 * 
	 * @param point
	 * @return projected and transformed point.
	*/
	function project(point:Point):Point;

	/**
	 * @param  point
	 * @return untransformed and unprojected point.
	 */
	function unproject(point:Point):Point;

	/**
	* @param location
	* @return projected and transformed coordinate for a location.
	*/
	function locationCoordinate(location:Location):Coordinate;

	/**
	* @param coordinate
	* @return untransformed and unprojected location for a coordinate.
	*/
	function coordinateLocation(coordinate:Coordinate):Location;

	function toString():String;
}