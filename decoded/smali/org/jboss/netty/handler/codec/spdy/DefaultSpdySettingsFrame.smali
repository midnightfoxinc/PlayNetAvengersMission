.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;
.super Ljava/lang/Object;
.source "DefaultSpdySettingsFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdySettingsFrame;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
    }
.end annotation


# instance fields
.field private clear:Z

.field private final settingsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    .line 146
    return-void
.end method

.method private appendSettings(Ljava/lang/StringBuilder;)V
    .locals 4
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 121
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->getSettings()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 122
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    .line 123
    .local v2, "setting":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
    const-string v3, "--> "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    const/16 v3, 0x3a

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->getValue()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    const-string v3, " (persist value: "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->isPersist()Z

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 129
    const-string v3, "; persisted: "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->isPersisted()Z

    move-result v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 131
    const/16 v3, 0x29

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 132
    sget-object v3, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 134
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;>;"
    .end local v2    # "setting":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
    :cond_0
    return-void
.end method

.method private getSettings()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clearPreviouslyPersistedSettings()Z
    .locals 1

    .prologue
    .line 109
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->clear:Z

    return v0
.end method

.method public getIds()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 33
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getValue(I)I
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 42
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 43
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 44
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->getValue()I

    move-result v1

    .line 46
    :goto_0
    return v1

    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public isPersistValue(I)Z
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 77
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 78
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 79
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->isPersist()Z

    move-result v1

    .line 81
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isPersisted(I)Z
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 93
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 94
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 95
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->isPersisted()Z

    move-result v1

    .line 97
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isSet(I)Z
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 38
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method public removeValue(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 70
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 71
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 72
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    :cond_0
    return-void
.end method

.method public setClearPreviouslyPersistedSettings(Z)V
    .locals 0
    .param p1, "clear"    # Z

    .prologue
    .line 113
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->clear:Z

    .line 114
    return-void
.end method

.method public setPersistValue(IZ)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "persistValue"    # Z

    .prologue
    .line 86
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 87
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 88
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-virtual {v1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->setPersist(Z)V

    .line 90
    :cond_0
    return-void
.end method

.method public setPersisted(IZ)V
    .locals 2
    .param p1, "id"    # I
    .param p2, "persisted"    # Z

    .prologue
    .line 102
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 103
    .local v0, "key":Ljava/lang/Integer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 104
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-virtual {v1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->setPersisted(Z)V

    .line 106
    :cond_0
    return-void
.end method

.method public setValue(II)V
    .locals 1
    .param p1, "id"    # I
    .param p2, "value"    # I

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, p1, p2, v0, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->setValue(IIZZ)V

    .line 52
    return-void
.end method

.method public setValue(IIZZ)V
    .locals 5
    .param p1, "id"    # I
    .param p2, "value"    # I
    .param p3, "persistValue"    # Z
    .param p4, "persisted"    # Z

    .prologue
    .line 55
    if-ltz p1, :cond_0

    const v2, 0xffffff

    if-le p1, v2, :cond_1

    .line 56
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Setting ID is not valid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 58
    :cond_1
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 59
    .local v0, "key":Ljava/lang/Integer;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 60
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    .line 61
    .local v1, "setting":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
    invoke-virtual {v1, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->setValue(I)V

    .line 62
    invoke-virtual {v1, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->setPersist(Z)V

    .line 63
    invoke-virtual {v1, p4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;->setPersisted(Z)V

    .line 67
    .end local v1    # "setting":Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;
    :goto_0
    return-void

    .line 65
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->settingsMap:Ljava/util/Map;

    new-instance v3, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;

    invoke-direct {v3, p2, p3, p4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame$Setting;-><init>(IZZ)V

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 139
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySettingsFrame;->appendSettings(Ljava/lang/StringBuilder;)V

    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 143
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
