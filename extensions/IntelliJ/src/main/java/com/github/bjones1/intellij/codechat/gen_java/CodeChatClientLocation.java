package com.github.bjones1.intellij.codechat.gen_java;
/**
 * Autogenerated by Thrift Compiler (0.16.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */

@javax.annotation.Generated(value = "Autogenerated by Thrift Compiler (0.16.0)", date = "2022-04-20")
public enum CodeChatClientLocation implements org.apache.thrift.TEnum {
  url(0),
  html(1),
  browser(2);

  private final int value;

  private CodeChatClientLocation(int value) {
    this.value = value;
  }

  /**
   * Get the integer value of this enum value, as defined in the Thrift IDL.
   */
  public int getValue() {
    return value;
  }

  /**
   * Find a the enum type by its integer value, as defined in the Thrift IDL.
   * @return null if the value is not found.
   */
  @org.apache.thrift.annotation.Nullable
  public static CodeChatClientLocation findByValue(int value) { 
    switch (value) {
      case 0:
        return url;
      case 1:
        return html;
      case 2:
        return browser;
      default:
        return null;
    }
  }
}