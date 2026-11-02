.class public interface abstract Lorg/jboss/netty/handler/codec/spdy/SpdyFrameDecoderDelegate;
.super Ljava/lang/Object;
.source "SpdyFrameDecoderDelegate.java"


# virtual methods
.method public abstract readDataFrame(IZLorg/jboss/netty/buffer/ChannelBuffer;)V
.end method

.method public abstract readFrameError(Ljava/lang/String;)V
.end method

.method public abstract readGoAwayFrame(II)V
.end method

.method public abstract readHeaderBlock(Lorg/jboss/netty/buffer/ChannelBuffer;)V
.end method

.method public abstract readHeaderBlockEnd()V
.end method

.method public abstract readHeadersFrame(IZ)V
.end method

.method public abstract readPingFrame(I)V
.end method

.method public abstract readRstStreamFrame(II)V
.end method

.method public abstract readSetting(IIZZ)V
.end method

.method public abstract readSettingsEnd()V
.end method

.method public abstract readSettingsFrame(Z)V
.end method

.method public abstract readSynReplyFrame(IZ)V
.end method

.method public abstract readSynStreamFrame(IIBZZ)V
.end method

.method public abstract readWindowUpdateFrame(II)V
.end method
