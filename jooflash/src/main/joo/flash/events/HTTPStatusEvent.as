package flash.events {

/**
 * The application dispatches HTTPStatusEvent objects when a network request returns an HTTP status code.
 * <p>HTTPStatusEvent objects are always sent before error or completion events. An HTTPStatusEvent object does not necessarily indicate an error condition; it simply reflects the HTTP status code (if any) that is provided by the networking stack. Some Flash Player environments may be unable to detect HTTP status codes; a status code of 0 is always reported in these cases.</p>
 * <p>In Flash Player, there is only one type of HTTPStatus event: <code>httpStatus</code>. In the AIR runtime, a FileReference, URLLoader, or URLStream can register to listen for an <code>httpResponseStatus</code>, which includes <code>responseURL</code> and <code>responseHeaders</code> properties. These properties are undefined in a <code>httpStatus</code> event.</p>
 * <p><a href="http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/events/HTTPStatusEvent.html#includeExamplesSummary">View the examples</a></p>
 */
public class HTTPStatusEvent extends Event {
  /**
   * The HTTP status code returned by the server. For example, a value of 404 indicates that the server has not found a match for the requested URI. HTTP status codes can be found in sections 10.4 and 10.5 of the HTTP specification at <a href="http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html">http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html</a>.
   * <p>If Flash Player or AIR cannot get a status code from the server, or if it cannot communicate with the server, the default value of 0 is passed to your code. A value of 0 can be generated in any player (for example, if a malformed URL is requested), and a value of 0 is always generated by the Flash Player plug-in when it is run in the following browsers, which do not pass HTTP status codes to the player: Netscape, Mozilla, Safari, Opera, and Internet Explorer for the Macintosh.</p>
   */
  public native function get status():int;

  /**
   * Creates an Event object that contains specific information about HTTP status events. Event objects are passed as parameters to event listeners.
   * @param type The type of the event. Event listeners can access this information through the inherited <code>type</code> property. There is only one type of HTTPStatus event: <code>HTTPStatusEvent.HTTP_STATUS</code>.
   * @param bubbles Determines whether the Event object participates in the bubbling stage of the event flow. Event listeners can access this information through the inherited <code>bubbles</code> property.
   * @param cancelable Determines whether the Event object can be canceled. Event listeners can access this information through the inherited <code>cancelable</code> property.
   * @param status Numeric status. Event listeners can access this information through the <code>status</code> property.
   *
   * @see #HTTP_STATUS
   *
   */
  public function HTTPStatusEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, status:int = 0) {
    super(type, bubbles, cancelable);
    this['status'] = status;
  }

  /**
   * Creates a copy of the HTTPStatusEvent object and sets the value of each property to match that of the original.
   * @return A new HTTPStatusEvent object with property values that match those of the original.
   *
   */
  override public function clone():Event {
    return new HTTPStatusEvent(type, bubbles, cancelable, status);
  }

  /**
   * Returns a string that contains all the properties of the HTTPStatusEvent object. The string is in the following format:
   * <p><code>[HTTPStatusEvent type=<i>value</i> bubbles=<i>value</i> cancelable=<i>value</i> status=<i>value</i>]</code></p>
   * @return A string that contains all the properties of the HTTPStatusEvent object.
   *
   */
  override public function toString():String {
    return formatToString("HTTPStatusEvent", "type", "bubbles", "cancelable", "status");
  }

  /**
   * The <code>HTTPStatusEvent.HTTP_STATUS</code> constant defines the value of the <code>type</code> property of a <code>httpStatus</code> event object.
   * <p>This event has the following properties:</p>
   * <table>
   * <tr><th>Property</th><th>Value</th></tr>
   * <tr>
   * <td><code>bubbles</code></td>
   * <td><code>false</code></td></tr>
   * <tr>
   * <td><code>cancelable</code></td>
   * <td><code>false</code>; there is no default behavior to cancel.</td></tr>
   * <tr>
   * <td><code>currentTarget</code></td>
   * <td>The object that is actively processing the Event object with an event listener.</td></tr>
   * <tr>
   * <td><code>status</code></td>
   * <td>The HTTP status code returned by the server.</td></tr>
   * <tr>
   * <td><code>target</code></td>
   * <td>The network object receiving an HTTP status code.</td></tr></table>
   * @see flash.display.LoaderInfo#event:httpStatus
   * @see flash.net.FileReference#event:httpStatus
   * @see flash.net.URLLoader#event:httpStatus
   * @see flash.net.URLStream#event:httpStatus
   *
   */
  public static const HTTP_STATUS:String = "httpStatus";
}
}
