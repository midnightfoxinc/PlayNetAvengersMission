.class final Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
.super Ljava/lang/Object;
.source "DefaultSpdySettingsFrame.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Setting"
.end annotation


# instance fields
.field private persist:Z

.field private persisted:Z

.field private value:I


# direct methods
.method constructor <init>(IZZ)V
    .locals 0
    .param p1, "value"    # I
    .param p2, "persist"    # Z
    .param p3, "persisted"    # Z

    .prologue
    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->value:I

    .line 154
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persist:Z

    .line 155
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persisted:Z

    .line 156
    return-void
.end method


# virtual methods
.method getValue()I
    .locals 1

    .prologue
    .line 159
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->value:I

    return v0
.end method

.method isPersist()Z
    .locals 1

    .prologue
    .line 167
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persist:Z

    return v0
.end method

.method isPersisted()Z
    .locals 1

    .prologue
    .line 175
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persisted:Z

    return v0
.end method

.method setPersist(Z)V
    .locals 0
    .param p1, "persist"    # Z

    .prologue
    .line 171
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persist:Z

    .line 172
    return-void
.end method

.method setPersisted(Z)V
    .locals 0
    .param p1, "persisted"    # Z

    .prologue
    .line 179
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->persisted:Z

    .line 180
    return-void
.end method

.method setValue(I)V
    .locals 0
    .param p1, "value"    # I

    .prologue
    .line 163
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->value:I

    .line 164
    return-void
.end method
