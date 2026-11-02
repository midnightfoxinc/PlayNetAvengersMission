.class abstract Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;
.super Ljava/lang/Object;
.source "ConcurrentIdentityHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "HashIterator"
.end annotation


# instance fields
.field currentKey:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field nextSegmentIndex:I

.field nextTableIndex:I

.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;)V
    .locals 1

    .prologue
    .line 1108
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1109
    iget-object v0, p1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextSegmentIndex:I

    .line 1110
    const/4 v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    .line 1111
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->advance()V

    .line 1112
    return-void
.end method


# virtual methods
.method final advance()V
    .locals 5

    .prologue
    .line 1129
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eqz v2, :cond_1

    .line 1151
    :cond_0
    :goto_0
    return-void

    .line 1133
    :cond_1
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    if-ltz v2, :cond_2

    .line 1134
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    iget v3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    add-int/lit8 v4, v3, -0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    aget-object v2, v2, v3

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eqz v2, :cond_1

    goto :goto_0

    .line 1139
    :cond_2
    iget v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextSegmentIndex:I

    if-ltz v2, :cond_0

    .line 1140
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    iget-object v2, v2, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;

    iget v3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextSegmentIndex:I

    add-int/lit8 v4, v3, -0x1

    iput v4, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextSegmentIndex:I

    aget-object v1, v2, v3

    .line 1141
    .local v1, "seg":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment<TK;TV;>;"
    iget v2, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->count:I

    if-eqz v2, :cond_2

    .line 1142
    iget-object v2, v1, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;->table:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1143
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    array-length v2, v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "j":I
    :goto_1
    if-ltz v0, :cond_2

    .line 1144
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    aget-object v2, v2, v0

    iput-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eqz v2, :cond_3

    .line 1145
    add-int/lit8 v2, v0, -0x1

    iput v2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    goto :goto_0

    .line 1143
    :cond_3
    add-int/lit8 v0, v0, -0x1

    goto :goto_1
.end method

.method public hasMoreElements()Z
    .locals 1

    .prologue
    .line 1125
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public hasNext()Z
    .locals 1

    .prologue
    .line 1154
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    :goto_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-eqz v0, :cond_1

    .line 1155
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1156
    const/4 v0, 0x1

    .line 1161
    :goto_1
    return v0

    .line 1158
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->advance()V

    goto :goto_0

    .line 1161
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method nextEntry()Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 1166
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-nez v0, :cond_1

    .line 1167
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 1170
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1171
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    .line 1172
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->advance()V

    .line 1173
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 1175
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    return-object v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 1179
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    if-nez v0, :cond_0

    .line 1180
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 1182
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1183
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1184
    return-void
.end method

.method public rewind()V
    .locals 2

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.HashIterator;"
    const/4 v1, 0x0

    .line 1115
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    iget-object v0, v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->segments:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Segment;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextSegmentIndex:I

    .line 1116
    const/4 v0, -0x1

    iput v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextTableIndex:I

    .line 1117
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentTable:[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1118
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->nextEntry:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1119
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->lastReturned:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 1120
    iput-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->currentKey:Ljava/lang/Object;

    .line 1121
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;->advance()V

    .line 1122
    return-void
.end method
